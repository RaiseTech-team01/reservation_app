const path = require("path");

module.exports = {
    resolve: {
        alias: {
            "@": path.resolve(__dirname, "..", "..", "app/javascript/"),
            "@components": path.resolve(
                __dirname,
                "..",
                "..",
                "app/javascript/components"
            ),
            "@pages": path.resolve(
                __dirname,
                "..",
                "..",
                "app/javascript/components/pages"
            ),
            "@assets": path.resolve(__dirname, "..", "..", "app/assets/"),
        },
    },
};
