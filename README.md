# Fedora KDE Plasma Welcome

This project contains extra pages and customizations for the
[Plasma Welcome](https://invent.kde.org/plasma/plasma-welcome) app that is part
of KDE Plasma for Fedora KDE Plasma.

## Creating archives for releases

```
# Tag the current commit
version="6.1.x"
tagname="v${version}"
git tag "${tagname}" HEAD
# Push the tag to the repo
git push --tags origin
```

Get the new tarball release from the
[release page](https://pagure.io/fedora-kde/plasma-welcome-fedora/releases).

## Licensing

This is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, under version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
