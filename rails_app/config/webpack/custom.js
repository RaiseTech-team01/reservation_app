const path = require("path");

module.exports = {
    resolve: {
        alias: {
            "@": path.resolve(__dirname, "..", "..", "app/javascript/"),
            "@pages": path.resolve(
                __dirname,
                "..",
                "..",
                "app/javascript/pages"
            ),
            "@components": path.resolve(
                __dirname,
                "..",
                "..",
                "app/javascript/components"
            ),
            "@assets": path.resolve(__dirname, "..", "..", "app/assets/"),
        },
    },
};
