=====================================================
Web testing with Robot Framework and Selenium2Library
=====================================================

`Robot Framework`_ is a generic open source test automation framework and
Selenium2Library_ is one of the many test libraries that can be used with
it. In addition to showing how they can be used together for web testing,
this demo introduces the basic Robot Framework test data syntax, how tests
are executed, and how logs and reports look like.

.. contents:: **Contents:**
   :depth: 1
   :local:

Test cases
==========

Test case files as well as a resource file used by them are located in
the ``login_test`` directory. Click file names below to see the latest versions
online.

`valid_login.robot`_
    A test suite with a single test for valid login.

    This test has a workflow that is created using keywords in
    the imported resource file.

`invalid_login.robot`_
    A test suite containing tests related to invalid login.

    These tests are data-driven by their nature. They use a single
    keyword, specified with the ``Test Template`` setting, that is called
    with different arguments to cover different scenarios.

    This suite also demonstrates using setups and teardowns in
    different levels.

`resource.robot`_
    A resource file with reusable keywords and variables.

    The system specific keywords created here form our own
    domain specific language. They utilize keywords provided
    by the imported Selenium2Library_.

See `Robot Framework User Guide`_ for more details about the test data syntax.

Generated results
=================

After `running tests`_ you will get report and log in HTML format. Example
files are also visible online in case you are not interested in running
the demo yourself:

- `report.html`_
- `log.html`_

Running demo
============

Preconditions
-------------

A precondition for running the tests is having `Robot Framework`_ and
Selenium2Library_ installed, and they in turn require
Python_. Robot Framework `installation instructions`__ cover both
Robot and Python installations, and Selenium2Library has its own
`installation instructions`__.

In practice it is easiest to install Robot Framework and
Selenium2Library along with its dependencies using `pip`_ package
manager. Once you have pip installed, all you need to do is running
these commands::

    pip install robotframework
    pip install robotframework-selenium2library

__ https://github.com/robotframework/robotframework/blob/master/INSTALL.rst
__ https://github.com/robotframework/Selenium2Library/blob/master/INSTALL.rst

Running tests
-------------

The `test cases`_ are located in the ``login_tests`` directory. They can be
executed using the ``robot`` command::

    robot login_tests

.. note:: If you are using Robot Framework 2.9 or earlier, you need to
          use the ``pybot`` command instead.

You can also run an individual test case file and use various command line
options supported by Robot Framework::

    robot login_tests/valid_login.robot
    robot --test InvalidUserName --loglevel DEBUG login_tests

Run ``robot --help`` for more information about the command line usage and see
`Robot Framework User Guide`_ for more details about test execution in general.

Using different browsers
------------------------

The browser that is used is controlled by ``${BROWSER}`` variable defined in
`resource.robot`_ resource file. Firefox browser is used by default, but that
can be easily overridden from the command line::

    robot --variable BROWSER:Chrome login_tests
    robot --variable BROWSER:IE login_tests

Consult Selenium2Library_ documentation about supported browsers. Notice also
that other browsers than Firefox require separate browser drivers to be
installed before they can be used with Selenium and Selenium2Library.

.. _Robot Framework: http://robotframework.org
.. _Selenium2Library: https://github.com/robotframework/Selenium2Library
.. _Python: http://python.org
.. _pip: http://pip-installer.org
.. _download page: https://bitbucket.org/robotframework/webdemo/downloads
.. _source code: https://bitbucket.org/robotframework/webdemo/src
.. _Robot Framework User Guide: http://robotframework.org/robotframework/#user-guide


Something else
==============
