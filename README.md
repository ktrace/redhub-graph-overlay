# redhub-graph-overlay
Gentoo overlay for graphics, CAD, animation programs.
Create issue when you need add apps, or if you found a bug. Pull requests are welcome.
Best ebuilds for best and most useful apps will move in main tree.

ADDED:
- DIGImend kernel drivers

TODO:
- FreeCAD
- qcad
- synfig
- leocad

How to use:

   1. Make sure you have installed package app-eselect/eselect-repository;
   2. Add custom repository: ```eselect repository add redhub-graph git https://github.com/ktrace/redhub-graph-overlay.git```
   3. Sync and update eix cache. Gentoo users may do ```eix-sync && eix-update```, Calculate Linux users must do ```emerge --sync && eix-update```, because Calculate use obsolete "layman".
   4. Check result by run ```eix digimend```, your must see digimend-kernel-drivers package and redhub-graph overlay.
