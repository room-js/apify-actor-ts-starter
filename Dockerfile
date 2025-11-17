FROM apify/actor-node:22 AS builder

COPY --chown=myuser:myuser package*.json Dockerfile ./

RUN npm ci --include=dev --audit=false

COPY --chown=myuser:myuser . ./

RUN npm run build

# Create final image
FROM apify/actor-node:22

COPY --chown=myuser:myuser package*.json ./

RUN npm ci --omit=dev

COPY --from=builder --chown=myuser:myuser /usr/src/app/dist ./dist

# Run the image.
CMD npm run start --silent
