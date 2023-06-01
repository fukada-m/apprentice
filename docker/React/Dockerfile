FROM node:latest

ENV HOST 0.0.0.0

WORKDIR /home/apprentice

# Install ESLint and Prettier
RUN npm install --save-dev eslint prettier eslint-config-prettier eslint-plugin-prettier

# Set up ESLint and Prettier configuration
RUN echo '{ "extends": [ "react-app", "plugin:prettier/recommended"], "rules": { "prettier/prettier": "error" }, "parserOptions": { "ecmaVersion": 2018 } }' > /home/apprentice/.eslintrc.json && \
    echo '{"singleQuote": true,"semi": false}' > /home/apprentice/.prettierrc
