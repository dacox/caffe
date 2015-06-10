if [[ ! -e $VIRTUAL_ENV/lib/python2.7/site-packages/skimage/__init__.py ]]; then
	for dep in `cat python/requirements.txt`; do
		pip install $dep
	done	
fi
