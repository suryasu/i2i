<<<<<<< HEAD
from flask import Flask, render_template, json, request
=======
from flask import Flask, render_template
>>>>>>> d0703d6ee5bd87c162b90d54635fa24dc4f4e621
app = Flask(__name__)

@app.route("/")
def main():
    #return "Welcome to I2I NOOB!"
    return render_template('index.html')

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')
 
@app.route('/signUp',methods=['POST'])
def signUp():
 
    # read the posted values from the UI
    _name = request.form['inputName']
    _email = request.form['inputEmail']
    _password = request.form['inputPassword']
    print _name
 
    # validate the received values
    if _name and _email and _password:
        print "Hi"
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
    app.run()
    
    
