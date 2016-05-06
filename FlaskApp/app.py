from flask import Flask, render_template, json, request, redirect, session, jsonify
from flask.ext.mysql import MySQL
from werkzeug import generate_password_hash, check_password_hash
import os
import uuid

mysql = MySQL()
app = Flask(__name__)
app.secret_key = 'why would I tell you my secret key?'
 
# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'dolphin123'
app.config['MYSQL_DATABASE_DB'] = 'bucketlist'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

app.config['UPLOAD_FOLDER'] = 'static/Uploads'


@app.route("/")
def main():
    #return "Welcome to I2I NOOB!"
    return render_template('index.html')


@app.route('/upload', methods=['GET', 'POST'])
def upload():
    if request.method == 'POST':
        file = request.files['file']
        extension = os.path.splitext(file.filename)[1]
        f_name = str(uuid.uuid4()) + extension
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], f_name))
        return json.dumps({'filename':f_name})

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')
 
@app.route('/signUp',methods=['POST', 'GET'])
def signUp():
 
    # read the posted values from the UI
    _name = request.form['inputName']
    _email = request.form['inputEmail']
    _password = request.form['inputPassword']
 
    # validate the received values
    if _name and _email and _password:

        conn = mysql.connect()
        cursor = conn.cursor()
        _hashed_password = generate_password_hash(_password)
        cursor.callproc('sp_createUser',(_name,_email,_hashed_password))
        
        data = cursor.fetchall()
 
        if len(data) is 0:
            conn.commit()
            # return redirect('/')
            return render_template('signUpSuccess.html')
            # return json.dumps({'message':'User created successfully !'})
        else:
            return redirect('/')
            # return render_template('index.html')
            return render_template('signUpFailure.html')
            # return json.dumps({'error':str(data[0])})
        

    else:
        return json.dumps({'html':'<span>Enter the required fields</span>'})

@app.route('/showSignin')
def showSignin():
    return render_template('signin.html')

@app.route('/validateLogin',methods=['POST'])
def validateLogin():
    try:
        _username = request.form['inputEmail']
        _password = request.form['inputPassword']
 
 
 
        # connect to mysql
 
        con = mysql.connect()
        cursor = con.cursor()
        cursor.callproc('sp_validateLogin',(_username,))
        data = cursor.fetchall()
 
 
 
 
        if len(data) > 0:
            if check_password_hash(str(data[0][3]),_password):
                session['user'] = data[0][0]
                return redirect('/userHome')
                
            else:
                return render_template('error.html',error = 'Wrong Email address or Password.')
        else:
            return render_template('error.html',error = 'Wrong Email address or Password.')
 
 
    except Exception as e:
        print "error"
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        con.close()

@app.route('/userHome')
def userHome():
    if session.get('user'):
        return render_template('userHome.html')
    else:
        return render_template('error.html',error = 'Unauthorized Access')

@app.route('/logout')
def logout():
    session.pop('user',None)
    return redirect('/')

@app.route('/projectHome')
def projectHome():
    return render_template('project.html')

@app.route('/createProject')
def createProject():
    if session.get('user'):
        return render_template('createproject.html')
    else:
        return render_template('error.html',error = 'Unauthorized Access')

@app.route('/addProject', methods=['POST'])
def addProject():
    try:
        if session.get('user'):
            _title = request.form['inputTitle']
            _category = request.form['inputCategory']
            _completion_time = request.form['inputCompleteTime']
            _num_collaborators = request.form['inputCollaborators']
            _description = request.form['inputDescription']
            _tags = request.form['inputTags']
            _user = session.get('user')
            if request.form.get('filePath') is None:
                _filePath = ''
            else:
                _filePath = request.form.get('filePath')

            print _title
            print _category
            print _completion_time
            print _num_collaborators
            print _description
            print _tags
 
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_addProject',(_title, _category, _completion_time, _num_collaborators, _description, _tags, _user, _filePath))
            data = cursor.fetchall()
 
            if len(data) is 0:
                conn.commit()
                return redirect('/userHome')
            else:
                return render_template('error.html',error = 'An error occurred!')
 
        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        conn.close()

@app.route('/getMyProjects')
def getMyProjects():
    try:
        if session.get('user'):
            _user = session.get('user')
 
            con = mysql.connect()
            cursor = con.cursor()
            cursor.callproc('sp_GetProjByUser',(_user,))
            myprojects = cursor.fetchall()
 
            projects_dict = []
            for proj in myprojects:
                proj_dict = {
                        'Id': proj[0],
                        'Title': proj[1],
                        'Category': proj[2],
                        'CompletionTime': proj[3],
                        'NumCollaborators': proj[4],
                        'Description': proj[5],
                        'Tags': proj[6],
                        'Date': proj[7],
                        'FilePath': proj[9],
                        'Creator': _user}
                projects_dict.append(proj_dict)
 
            return json.dumps(projects_dict)
        else:
            return render_template('error.html', error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html', error = str(e))

@app.route('/getAllProjects')
def getAllProjects():
    try:
        if session.get('user'):
             
            con = mysql.connect()
            cursor = con.cursor()
            cursor.callproc('sp_getAllProjects')
            result = cursor.fetchall()
 
            projects_dict = []
            for proj in result:
                proj_dict = {
                        'Id': proj[0],
                        'Title': proj[1],
                        'Category': proj[2],
                        'CompletionTime': proj[3],
                        'NumCollaborators': proj[4],
                        'Description': proj[5],
                        'Tags': proj[6],
                        'DateMade': proj[8],
                        'FilePath': proj[9], 
                        'Like':proj[10]}
                projects_dict.append(proj_dict)     
 
            return json.dumps(projects_dict)
        else:
            return render_template('error.html', error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html', error = str(e))

@app.route('/addUpdateLike',methods=['POST'])
def addUpdateLike():
    try:
        if session.get('user'):
            _projectId = request.form['wish']
            _like = request.form['like']
            _user = session.get('user')
            
 
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_AddUpdateLikes',(_projectId,_user,_like))
            data = cursor.fetchall()
 
            if len(data) is 0:
                conn.commit()
                return json.dumps({'status':'OK'})
            else:
                return render_template('error.html',error = 'An error occurred!')
 
        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        conn.close()

@app.route('/findProjects')
def findProjects():
    return redirect('/showDashboard')  

@app.route('/myProjects')
def myProjects():
    return render_template('myProjects.html')   

@app.route('/signUpSuccess')
def signUpSuccess():
    print "beyy"
    return render_template('signUpSuccess.html')   


@app.route('/signUpFailure')
def signUpFailure():
    print "eyy"
    return render_template('signUpFailure.html')  

@app.route('/showDashboard')
def showDashboard():
    return render_template('dashboard.html')

if __name__ == "__main__":
    app.run(debug=True)
    
    
