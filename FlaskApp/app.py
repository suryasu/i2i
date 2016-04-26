from flask import Flask, render_template, json, request
from flask.ext.mysqldb import MySQL
	
from werkzeug import generate_password_hash, check_password_hash
app = Flask(__name__)
mysql = MySQL(app)
 
# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'dolphin123'
app.config['MYSQL_DATABASE_DB'] = 'bucketlist'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)



@app.route("/")
def main():
    #return "Welcome to I2I NOOB!"
    return render_template('index.html')

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')
 
@app.route('/signUp',methods=['POST', 'GET'])
def signUp():
 
    # read the posted values from the UI
    _name = request.form['inputName']
    _email = request.form['inputEmail']
    _password = request.form['inputPassword']
    print _name
 
    # validate the received values
    if _name and _email and _password:
        #conn = mysql.connect()
        #cursor = conn.cursor()
        
        cur = mysql.connection.cursor()
        
        # _hashed_password = generate_password_hash(_password)
        # cursor.callproc('sp_createUser',(_name,_email,_hashed_password))
        
        # data = cursor.fetchall()
 
        # if len(data) is 0:
            # conn.commit()
            # return json.dumps({'message':'User created successfully !'})
        # else:
            # return json.dumps({'error':str(data[0])})
            
        return json.dumps({'html':'<span>All fields good !!</span>'})
        

    else:
        print "Bye"
        return json.dumps({'html':'<span>Enter the required fields</span>'})

@app.route('/projectHome')
def projectHome():
    return render_template('project.html')

@app.route('/createProject')
def createProject():
    return render_template('createproject.html')
    


if __name__ == "__main__":
    app.run(debug=True)
    
    
