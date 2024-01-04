# site-copy

Need to be able to give a url, copy html file of page, and any resource on the page in original structure locally

This will be used with a list of urls to completely clone a site (use the site map)


## Requirements

cli
- ARG1 = URL
- ARG2 = directory

- Download html file
    - store in ARG2 based on URI
- Parse html files for local content (Imgs, Scripts, CSS)
    - store in ARG2 based on url path

https://hackage.haskell.org/package/scalpel

https://clutchmov.com/
