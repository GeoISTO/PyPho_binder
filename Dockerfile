ARG BASE_IMAGE_TAG=latest
FROM ghcr.io/pyvista/pyvista:$BASE_IMAGE_TAG

COPY . ${HOME}
WORKDIR ${HOME}
RUN pip install -r requirements.txt

RUN echo "-----------------------------------------"
RUN echo "Pypho Docker part"
RUN echo "Adding pypho dependencies: pandas scipy"
RUN pip install pandas scipy
RUN echo "getting pyho files"
RUN mkdir pypho
RUN wget -O pypho/__init__.py https://raw.githubusercontent.com/GeoISTO/PyPho/refs/heads/main/pypho/__init__.py
RUN wget -O pypho/camera.py https://raw.githubusercontent.com/GeoISTO/PyPho/refs/heads/main/pypho/camera.py
RUN wget -O pypho/graphics.py https://raw.githubusercontent.com/GeoISTO/PyPho/refs/heads/main/pypho/graphics.py
RUN wget -O pypho/target.py https://raw.githubusercontent.com/GeoISTO/PyPho/refs/heads/main/pypho/target.py
RUN wget -O pypho/rock_texture.vti https://raw.githubusercontent.com/GeoISTO/PyPho/refs/heads/main/pypho/rock_texture.vti
RUN wget -O ./pyproject.toml https://raw.githubusercontent.com/GeoISTO/PyPho/refs/heads/main/pyproject.toml
RUN echo "End Pypho Docker part"
RUN echo "-----------------------------------------"