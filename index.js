//for webserver to be created
const express = require("express");
//create a webserver using express
const app = express();
//serve all the files in the frontend folder
app.use(express.static("main"));
//start the webserver on port 3000
const SERVER_PORT = 3000;
app.listen(process.env.PORT || SERVER_PORT, () => {
  console.log("Server listening on port: " + SERVER_PORT);
});
