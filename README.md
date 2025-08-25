# PyPho_notebooks

This repository is to make the [PyPho](https://github.com/GeoISTO/PyPho_notebooks) illustrating [PyPho](https://github.com/GeoISTO/PyPho) available on [Binder](https://mybinder.org/).  
The notebooks can be used directly online without installation thanks to [Binder](https://mybinder.org/).

## Notebooks

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/GeoISTO/PyPho_binder/HEAD?urlpath=%2Fdoc%2Ftree%2Fnotebooks)
1. Minimal Example: 

### Devnotes:

This repository was created with [cookiecutter](https://github.com/audreyr/cookiecutter) and [pyvsita cookie cutter](https://github.com/pyvista/cookiecutter-pyvista-binder)

1. go to folder ```cd where_to_create_repo```
1. New env ```conda create -n pypho_binder python=3.12 pipx```
1. activate ```conda activate pypho_binder```
1. add path to git: ```set PATH=%PATH%;Path_to_Git\Git\bin```
1. run the cookiecutter ```pipx run cookiecutter gh:pyvista/cookiecutter-pyvista-binder```
1. Publish the created repo to Github

### Remove local information from the versionning

`.gitattributes` is setting up a `jq` filter `nbstrip` to remove metadata and execution counts from notebooks before commit.

To be effective, you must add the following piece of script in the .git/config:

	[filter "nbstrip"]
	clean = "jq --indent 1 \
			'(.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
			| .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
			| .cells[].metadata = {} \
			'"
