# Robotframework Web Automation with Selenium and Python

### __PRE-REQUISITES__
#### Python
- Manual install Mac -> [Install Python]([https://www.oracle.com/java/technologies/downloads/#jdk21-mac](https://www.python.org/downloads/macos/))
- Homebrew -> `brew install python`
- Check install version `python3 --version`

#### 

#### IDE
Install an IDE for the Robotframework/Selenium Project
- [Pycharm](https://www.jetbrains.com/pycharm/download/?section=mac)
- [VSCode](https://code.visualstudio.com/download)
  - Must add Python Plugin in VSCode to get pythong language to work


### __QUICK INSTALLATION__
1. cd to the directory where requirements.txt is located
2. activate your virtualenv
3. run: `pip3 install -r requirements.txt` in your shell

### __INSTALLATION Step-By-Step__
1. Create a Virtual Environment
Navigate to your project directory and create a virtual environment:
```
python -m venv robot_venv
```
2. Activate the Virtual Environment
```
source robot_venv/bin/activate
```
3. Install Robot Framework and Libraries
```
pip3 install robotframework
pip3 install robotframework-seleniumlibrary
```
 - (Optional: Save the dependencies to a requirements.txt file for easy sharing or recreation.)
  `pip freeze > requirements.txt`

### __COMMAND LINE__
Headed Run
```
robot --outputdir report -v BROWSER:chrome -v USERNAME:{password} -v PASSWORD:{username} robotFramework/tests/test_login.robot
```

Headless Run
```
robot --outputdir report -v USERNAME:{password} -v PASSWORD:{username} robotFramework/tests/test_login.robot
```

### References
[Robot Framework](https://robotframework.org/)
[Robot Framework Libraries](https://robotframework.org/robotframework/#standard-libraries)
[Robot Framework UserGuide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
[Robot Framework Selenium Library](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
[Robot Framework Rescourse](https://robotframework.org/#resources)
