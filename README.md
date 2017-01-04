cygwin-ps-misc
==============


Purpose
-------

Utilities that provide missing tools from cygwin, like well-working "pidof" and "killall". Written in python.

These utils are present in some cygwin installations, but do not work correctly. The following fails on the latest installation (as of Jan 4, 2016) for me:

	python -c "import time; time.sleep(60)"
	killall python



Depends on python installed in cygwin.

Other Alternates
----------------

Also see https://github.com/kata198/myps2 for a working version of ps on cygwin
