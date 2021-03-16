#!/bin/python2
# no lyrics or cover

""" Copy ID3 tags from one mp3 file to another. """

import mutagen
import argparse


def _main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        'srcname', metavar='source_file', type=str,
        help='name of mp3 file to get tags from')
    parser.add_argument(
        'destname', metavar='destination_file', type=str,
        help='name of mp3 file to copy tags into')
    parser.add_argument(
        '-v', '--verbose', action="store_true",
        help='Display the resulting set of tags when done.')
    args = parser.parse_args()
    copy_id3(args.srcname, args.destname, args.verbose)


def copy_id3(srcname, destname, verbose=False):
    """ Copy ID3 tags from srcname to destname. """
    src = mutagen.File(srcname, easy=True)
    dest = mutagen.File(destname, easy=True)
    for k in src:
        dest[k] = src[k]
    dest.save()
    if verbose:
        print "Copied ID3 tags from %(srcname)r to %(destname)r--result:" % locals()
        print dest.pprint()


if __name__ == "__main__":
    _main()
