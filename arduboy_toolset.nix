{pkgs}: pkgs.python3Packages.buildPythonApplication {
  pname = "arduboy_toolset";
  version = "0.1.0";
  preBuild = ''
    ls
    cat > setup.py << EOF
from setuptools import setup

with open('requirements.txt', 'r', encoding='utf-16') as f:
  contents = f.read()
  print(contents)
  install_requires = contents.splitlines()

setup(
  name='arduboy_toolset',
  #packages=['someprogram'],
  version='0.7.1',
  author='randomouscrap98',
  #description='...',
  install_requires=[],# install_requires,
  packages = ['.', 'arduboy'],
  entry_points={
    # example: file some_module.py -> function main
    #'console_scripts': ['someprogram=some_module:main']
    'gui_scripts': ['arduboy_toolset=main_gui:main']
  },
)
EOF
  '';
  src = pkgs.fetchFromGitHub {
    owner = "randomouscrap98";
    repo = "arduboy_toolset";
    rev = "v0.7.1";
    hash = "sha256-c3uw2wxplj8HtzfdaUJ0P7KaIR/QUftJVKz/G+gBHYY=";
  };
  nativeBuildInputs = [
    pkgs.python3Packages.pythonRelaxDepsHook
  ];
  # pythonRelaxDeps = true;
  # pythonRemoveDeps = ["pywin32-ctypes" "pyinstaller" "pyinstaller-hooks-contrib"];
  # propagatedBuildInputs = with pkgs.python3Packages; [ pip setuptools ];
  propagatedBuildInputs = with pkgs.python3Packages; [
    setuptools
    altgraph#  ==0.17.3
    certifi#  ==2023.7.22
    charset-normalizer#  ==3.3.0
    demjson3#  ==3.0.6
    idna#  ==3.4
    intelhex#  ==2.3.0
    pefile#  ==2023.2.7
    pillow#  ==10.1.0
    # pyinstaller#  ==5.13.0
    # pyinstaller-hooks-contrib#  ==2023.6
    pyqt6#  ==6.5.2
    # pyqt6-qt6#  ==6.5.2
    pyqt6-sip#  ==13.5.2
    pyserial#  ==3.5
    python-slugify#  ==8.0.1
    # pywin32-ctypes#  ==0.2.2
    requests#  ==2.31.0
    text-unidecode#  ==1.3
    urllib3#  ==2.0.6
  ];
  # doCheck = false;
}
