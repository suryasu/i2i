from flask import Flask, render_template
app = Flask(__name__)

@app.route("/")
def main():
    #return "Welcome to I2I NOOB!"
    return render_template('index.html')

@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')

@app.route('/projectHome')
def projectHome():
    return render_template('project.html')

@app.route('/createProject')
def createProject():
    return render_template('createproject.html')

if __name__ == "__main__":
    app.run()
    
    
