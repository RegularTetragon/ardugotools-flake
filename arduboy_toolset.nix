{pkgs}: pkgs.python3Packages.buildPythonPackage {
  name = "arduboy-toolset";
  preBuild = ''
    ls
    cat requirements.txt
    cat > setup.py << EOF
from setuptools import setup

with open('requirements.txt') as f:
  install_requires = f.read().splitlines()

setup(
  name='arduboy_toolset',
  #packages=['someprogram'],
  version='0.7.1',
  author='randomouscrap98',
  #description='...',
  install_requires=install_requires,
  entry_points={
    # example: file some_module.py -> function main
    #'console_scripts': ['someprogram=some_module:main']
    'gui_scripts': ['arduboy_toolset=main_gui.py:main']
  },
)
  '';
  src = pkgs.fetchFromGitHub {
    owner = "randomouscrap98";
    repo = "arduboy_toolset";
    rev = "v0.7.1";
    hash = "sha256-c3uw2wxplj8HtzfdaUJ0P7KaIR/QUftJVKz/G+gBHYY=";
  };
  propagatedBuildInputs = [];
}
