const path = require("path");

module.exports = {
    resolve: {
        alias: {
            "@": path.resolve(__dirname, "..", "..", "app/javascript/"),
            "@assets": path.resolve(__dirname, "..", "..", "app/assets/"),
            "@components": path.resolve(
                __dirname,
                "..",
                "..",
                "app/javascript/components"
            ),
        },
    },
};
