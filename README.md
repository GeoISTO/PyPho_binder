# PyPho_notebooks

This repository is to make the [PyPho notebooks](https://github.com/GeoISTO/PyPho_notebooks) illustrating [PyPho](https://github.com/GeoISTO/PyPho) available on [Binder](https://mybinder.org/).  
The notebooks can be used directly online without installation thanks to [Binder](https://mybinder.org/).

## Notebooks on Binder

You can run the PyPho's notebooks directly on binder, online, no installation needed (see below).  
If you want to get PyPho locally see the main repository [PyPho Repo](https://github.com/GeoISTO/PyPho) or the [Notebook repository](https://github.com/GeoISTO/PyPho_notebooks).

To access the folder with all the notebooks: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/GeoISTO/PyPho_binder/HEAD?urlpath=%2Fdoc%2Ftree%2Fnotebooks)  
Aternativelly, go directly to a specific notebook:
1. [![Binder](https://mybinder.org/badge_logo.svg) **PyPho's Minimal Example**](https://mybinder.org/v2/gh/GeoISTO/PyPho_binder/HEAD?urlpath=%2Fdoc%2Ftree%2Fnotebooks%2F01_minimal_example.ipynb) : This example shows how to create a basic camera and scene, visualize it interactively, and change the property shown on objects.
1. [![Binder](https://mybinder.org/badge_logo.svg) **Camera definition**](https://mybinder.org/v2/gh/GeoISTO/PyPho_binder/HEAD?urlpath=%2Fdoc%2Ftree%2Fnotebooks%2F02_camera_definition.ipynb): 
1. [![Binder](https://mybinder.org/badge_logo.svg) **Target Objects**](https://mybinder.org/v2/gh/GeoISTO/PyPho_binder/HEAD?urlpath=%2Fdoc%2Ftree%2Fnotebooks%2F03_target_objects.ipynb): 
1. [![Binder](https://mybinder.org/badge_logo.svg) **Camera Manipulation**](https://mybinder.org/v2/gh/GeoISTO/PyPho_binder/HEAD?urlpath=%2Fdoc%2Ftree%2Fnotebooks%2F04_camera_manipulation.ipynb): 

## Devnotes:

This repository was created with [cookiecutter](https://github.com/audreyr/cookiecutter) and [pyvsita cookie cutter](https://github.com/pyvista/cookiecutter-pyvista-binder).  
Properly installing PyPho as a dependencies seems to introduce complications with the configuration  
as it is not meant to work with the same vtk as the special configuration of pyvista in binder.  
As a workaround, pypho's dependencies have been added to the [Dockerfile](./Dockerfile) and pypho's files are wget from the GitHub repository.  
These files are downloaded again in the [start](./start) script to make sure they are up-to-date.

Setup of the repository:
1. go to folder ```cd where_to_create_repo```
1. New env ```conda create -n pypho_binder python=3.12 pipx```
1. activate ```conda activate pypho_binder```
1. add path to git: ```set PATH=%PATH%;Path_to_Git\Git\bin```
1. run the cookiecutter ```pipx run cookiecutter gh:pyvista/cookiecutter-pyvista-binder```
1. Publish the created repo to Github

Pypho then needs to be loaded locally in the notebook by adding the [root (..)](..) folder to the path.  
This is achieved by adding at the start of the notebooks:
```
import sys
sys.path.append("..)
```

## Remove local information from the versionning

`.gitattributes` is setting up a `jq` filter `nbstrip` to remove metadata and execution counts from notebooks before commit.

To be effective, you must add the following piece of script in the .git/config:

	[filter "nbstrip"]
	clean = "jq --indent 1 \
			'(.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
			| .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
			| .cells[].metadata = {} \
			'"
