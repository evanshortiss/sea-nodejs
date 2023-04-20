# Build stage. This is used to generate the Node.js exceutable
FROM quay.io/evanshortiss/node:20.0.0 as builder

USER node
WORKDIR /usr/src/app

COPY --chown=node:node . .

# Install dependencies, build the source, and bundle it into a single file
RUN npm ci
RUN npm run build
RUN npm run bundle

# Generate the SEA blob and binary
RUN node --experimental-sea-config sea-config.json 
RUN cp $(command -v node) sea
RUN npx postject sea NODE_SEA_BLOB build/bundle.blob --sentinel-fuse NODE_SEA_FUSE_fce680ab2cc467b6e072b8b5df1996b2  

# Now that the Node.js SEA is built, copy it into a minimal container image
FROM registry.access.redhat.com/ubi8/ubi-minimal

USER 1001
WORKDIR /usr/src/app

COPY --chown=1001:1001 --from=builder /usr/src/app/sea .

CMD ./sea