# run-flutter-from-docker-container

I would like to be able to run `flutter` without having to install it on my laptop.
So I do this:

```
bash-3.2$ cat dockerfile-flutter
FROM cirrusci/flutter:latest
MAINTAINER "Red Cricket <redcricket@protonmail.com>"

CMD init
bash-3.2$ cat docker_build.sh
#!/bin/bash

docker build -f dockerfile-flutter -t flutter .
bash-3.2$
bash-3.2$ bash docker_build.sh
[+] Building 0.1s (5/5) FINISHED
 => [internal] load build definition from dockerfile-flutter                                              0.0s
 => => transferring dockerfile: 142B                                                                      0.0s
 => [internal] load .dockerignore                                                                         0.0s
 => => transferring context: 2B                                                                           0.0s
 => [internal] load metadata for docker.io/cirrusci/flutter:latest                                        0.0s
 => CACHED [1/1] FROM docker.io/cirrusci/flutter:latest                                                   0.0s
 => exporting to image                                                                                    0.0s
 => => exporting layers                                                                                   0.0s
 => => writing image sha256:f3f445b767643ce56827a43d09ddb6cb6c29cd3ce387a86281eabd3c29d89788              0.0s
 => => naming to docker.io/library/flutter                                                                0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
bash-3.2$
```

Run `flutter` like so:

```
bash-3.2$ cat docker_run.sh
docker run -it -w /app -v $(pwd):/app flutter flutter $@
bash-3.2$ bash docker_run.sh create foo
Creating project foo...
Running "flutter pub get" in foo...                                 4.0s
Wrote 127 files.

All done!
In order to run your application, type:

  $ cd foo
  $ flutter run

Your application code is in foo/lib/main.dart.

bash-3.2$ ls -l foo/
total 40
-rw-r--r--   1 russellcecala  staff   546 Dec 27 16:57 README.md
-rw-r--r--   1 russellcecala  staff  1453 Dec 27 16:57 analysis_options.yaml
drwxr-xr-x  12 russellcecala  staff   384 Dec 27 16:58 android
-rw-r--r--   1 russellcecala  staff   896 Dec 27 16:57 foo.iml
drwxr-xr-x   7 russellcecala  staff   224 Dec 27 16:57 ios
drwxr-xr-x   3 russellcecala  staff    96 Dec 27 16:57 lib
drwxr-xr-x   8 russellcecala  staff   256 Dec 27 16:57 linux
drwxr-xr-x   7 russellcecala  staff   224 Dec 27 16:57 macos
-rw-r--r--   1 russellcecala  staff  3630 Dec 27 16:58 pubspec.lock
-rw-r--r--   1 russellcecala  staff  3868 Dec 27 16:57 pubspec.yaml
drwxr-xr-x   3 russellcecala  staff    96 Dec 27 16:57 test
drwxr-xr-x   6 russellcecala  staff   192 Dec 27 16:57 web
drwxr-xr-x   6 russellcecala  staff   192 Dec 27 16:57 windows
```
