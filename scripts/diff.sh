#! /bin/sh

ldir="${1}"
bdir="${2}"

diff -r ${ldir}/ ${bdir}/ | sed -e "{
                                        /Common subdirectories: .*/ d
                                        s/\/home\/lukew\/Documents/L/
                                        s/\/h\/Documents/B/
                                        s/^diff -r/Files:/
                                        s/^< /L: /
                                        s/^> /B: /
                                        /^[0-9,]*[cad][0-9,]*$/ d
                                        s/^---$/--/
                                      }"
                                        # /^Files:/{n; /^L:/ s/nL:/}
                                        # s/^diff -r/\n\nFiles:/
