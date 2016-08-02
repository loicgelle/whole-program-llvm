
all:
	@echo 'To develop       :    "make develop"'
	@echo 'To test install  :    "make testinstall"'
	@echo 'To install       :    "make install"'
	@echo 'To test publish  :    "make testpublish"'
	@echo 'To publish       :    "make publish"'


#local editable install for developing
develop: 
	pip install -e .


dist: clean
	python setup.py bdist_wheel

# If you need to push this project again,
# INCREASE the version number in wllvm/version.py,
# otherwise the server will give you an error. 

testpublish: dist
	python setup.py register -r https://testpypi.python.org/pypi
	python setup.py sdist upload -r https://testpypi.python.org/pypi

testinstall:
	pip install -i https://testpypi.python.org/pypi wllvm

publish: dist
	python setup.py register -r https://pypi.python.org/pypi
	python setup.py sdist upload -r https://pypi.python.org/pypi

install:
	pip install 

clean:
	rm -f  wllvm/*.pyc wllvm/*~

