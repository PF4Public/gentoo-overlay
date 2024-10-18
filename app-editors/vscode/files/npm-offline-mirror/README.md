# offline-mirror-registry

A small registry that (sorta) mimics what yarn's offline mirror does with npm.

tl;dr if you have a directory with a bunch of modules like what yarn generates:

```sh
❯ ls /offline-mirror
asynckit-0.4.0.tgz           @types-body-parser-1.19.2.tgz
axios-1.1.2.tgz              @types-connect-3.4.35.tgz
combined-stream-1.0.8.tgz    @types-express-4.17.14.tgz
delayed-stream-1.0.0.tgz     @types-express-serve-static-core-4.17.31.tgz
follow-redirects-1.15.2.tgz  @types-mime-3.0.1.tgz
form-data-4.0.0.tgz          @types-node-18.8.5.tgz
mime-db-1.52.0.tgz           @types-qs-6.9.7.tgz
mime-types-2.1.35.tgz        @types-range-parser-1.2.4.tgz
proxy-from-env-1.1.0.tgz     @types-serve-static-1.15.0.tgz
```

Then running `offline-mirror-registry -p 30000 /offline-mirror` will start a
server running at `http://localhost:30000/`.

From there, you can run `npm --registry http://localhost:30000/ install axios`
or any other modules.
