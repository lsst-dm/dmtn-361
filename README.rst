.. image:: https://img.shields.io/badge/dmtn--361-lsst.io-brightgreen.svg
   :target: https://dmtn-361.lsst.io
.. image:: https://github.com/lsst-dm/dmtn-361/workflows/CI/badge.svg
   :target: https://github.com/lsst-dm/dmtn-361/actions/

#######################################################################################
Rubin Data Management: Delivering awe and wonder and weathering organizational upheaval
#######################################################################################

DMTN-361
========

Rubin is now about one  year in operations and DM has delivered several Data Previews including DP2 which contains the extensive and  good commissioning data. We will show some results (yes pretty pictures ) of our superb pipelines, discuss some of the challenges of moving and processing TBs of data from Chile and to serving Ks of users. We will perhaps mention a few lessons learned. Rubin has also transitioned from a stand alone project to being embedded in an organisation - we shall ponder organisational inertia and team vs organisational clashes.

Links
=====

- Live drafts: https://dmtn-361.lsst.io
- GitHub: https://github.com/lsst-dm/dmtn-361

Build
=====

This repository includes lsst-texmf_ as a Git submodule.
Clone this repository::

    git clone --recurse-submodules https://github.com/lsst-dm/dmtn-361

Compile the PDF::

    make

Clean built files::

    make clean

Updating acronyms
-----------------

A table of the technote's acronyms and their definitions are maintained in the `acronyms.tex` file, which is committed as part of this repository.
To update the acronyms table in ``acronyms.tex``::

    make acronyms.tex

*Note: this command requires that this repository was cloned as a submodule.*

The acronyms discovery code scans the LaTeX source for probable acronyms.
You can ensure that certain strings aren't treated as acronyms by adding them to the `skipacronyms.txt <./skipacronyms.txt>`_ file.

The lsst-texmf_ repository centrally maintains definitions for LSST acronyms.
You can also add new acronym definitions, or override the definitions of acronyms, by editing the `myacronyms.txt <./myacronyms.txt>`_ file.

Updating lsst-texmf
-------------------

`lsst-texmf`_ includes BibTeX files, the ``lsstdoc`` class file, and acronym definitions, among other essential tooling for LSST's LaTeX documentation projects.
To update to a newer version of `lsst-texmf`_, you can update the submodule in this repository::

   git submodule update --init --recursive

Commit, then push, the updated submodule.

.. _lsst-texmf: https://github.com/lsst/lsst-texmf
