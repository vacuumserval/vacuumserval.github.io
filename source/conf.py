# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'microTi'
copyright = '2024, chat dans le bâtiment 5'
author = 'chat dans le bâtiment 5'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'nbsphinx',
    'sphinx.ext.mathjax', 
    'myst_parser',
]

templates_path = ['_templates']
exclude_patterns = []



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

# html_theme = 'sphinx_rtd_theme'
html_theme = 'sphinx_material'
html_static_path = ['_static']

# Material theme options (see theme.conf for more information)
html_theme_options = {

    # Set the name of the project to appear in the navigation.
    'nav_title': 'microTi',
    'logo_icon': '&#xE91D',

    # Set you GA account ID to enable tracking
    # 'google_analytics_account': 'UA-XXXXX',

    # Specify a base_url used to generate sitemap.xml. If not
    # specified, then no sitemap will be built.
    'base_url': 'https://vacuumserval.github.io/',

    # Set the color and the accent color
    # 'color_primary': 'blue',
    # 'color_accent': 'light-blue',

    'html_minify': True,
    'css_minify': True,

    # Set the repo location to get a badge with stats
    'repo_url': 'https://github.com/vacuumserval/vacuumserval.github.io',
    'repo_name': 'microTi',

    # Visible levels of the global TOC; -1 means unlimited
    'globaltoc_depth': 1,
    # If False, expand all TOC entries
    'globaltoc_collapse': False,
    # If True, show hidden TOC entries
    'globaltoc_includehidden': False,
}

html_sidebars = {
    "**": ["logo-text.html", "globaltoc.html", "localtoc.html", "searchbox.html"]
}

html_favicon = "./_static/image/pets.ico"

# html_logo = "mepro_headshot.png"
# html_logo = "_static/image/sign.png"