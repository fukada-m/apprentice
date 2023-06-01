FROM node:latest

ENV HOST 0.0.0.0

WORKDIR /home/apprentice

# Create React App
RUN npx create-react-app app

# Install ESLint and Prettier
RUN cd app && \
    npm install --save-dev eslint prettier eslint-config-prettier eslint-plugin-prettier

# Set up ESLint and Prettier configuration
RUN echo '{ "extends": [ "react-app", "plugin:prettier/recommended"], "rules": { "prettier/prettier": "error" }, "parserOptions": { "ecmaVersion": 2018 } }' > /home/apprentice/app/.eslintrc.json && \
    echo '{"singleQuote": true,"semi": false}' > /home/apprentice/app/.prettierrc

WORKDIR /home/apprentice/app
