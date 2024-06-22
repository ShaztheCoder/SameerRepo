const cds = require("@sap/cds");
const odat = require("@sap/cds-odata-v2-adapter-proxy");

cds.on("bootstrap",(app)=>{
    app.use(odat());
});

module.exports = cds.server;