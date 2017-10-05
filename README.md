# Robotframework Tests

##Installation steps (pre-requisites):
1. Install latest version of Python2 [https://www.python.org/ftp/python/2.7.13/python-2.7.13.msi](python2)
   - install as admin
   - ensure pip is installed
   - ensure add python to path is also selected
   - test by running
     ```
     $ python -V
     $ pip -V
     ```
2. Install robotframework
   ```
   $ pip install robotframework
   ```
   If you're behind proxy
   ```
   $ pip install robotframework --proxy=genproxy.amdocs.com:8080
   ```
3. Install selenium2library
   ```
   $ pip install robotframework-selenium2library
   ```
   If you're behind proxy
   ```
   $ pip install robotframework-selenium2library --proxy=genproxy.amdocs.com:8080
   ```
4. Install Excel library
   ```
   $ pip install robotframework-excellibrary
   ```
   If you're behind proxy
   ```
   $ pip install robotframework-excellibrary --proxy=genproxy.amdocs.com:8080
   ```
5. Install Faker library
   ```
   $ pip install robotframework-faker
   ```
   If you're behind proxy
   ```
   $ pip install robotframework-faker --proxy=genproxy.amdocs.com:8080
   ```
To view additional libraries you may visit: "pypi.python.org/pypi"

##To dowload pydev eclipse plug-in follow below steps:
   ```
   - Open eclipse.
   - Hit url- https://marketplace.eclipse.org/content/pydev-python-ide-eclipse
   - Drag and drop the "Install" widget into eclipse.
   ```
##Chrome driver setup    
   ```
   - Make sure chrome version should be 60.0.3112.*
   - Chrome driver version should be 2.30
   ```
    
##To get code
   ```
   $ git clone ssh://git@ilrnaypam01:7999/nlt/nlt_portal_robot.git
   ```

##To run
   ```
   $ run_robotframework_test.bat
   ```