const path = require('path');
const fs = require('fs');
const { fileLoader, mergeTypes } = require('merge-graphql-schemas');

const typesArray = fileLoader('graphql/**/*.{gql,graphql}', {
    recursive: true
});

const mergedSchema = mergeTypes(typesArray);

fs.writeFileSync('../web/schema.graphql', mergedSchema, {encoding: 'utf8'});
