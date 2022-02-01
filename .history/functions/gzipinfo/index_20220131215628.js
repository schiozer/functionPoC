/**
 * Describe Gzipinfo here.
 *
 * The exported method is the entry point for your code when the function is invoked. 
 *
 * Following parameters are pre-configured and provided to your function on execution: 
 * @param event: represents the data associated with the occurrence of an event, and  
 *                 supporting metadata about the source of that occurrence.
 * @param context: represents the connection to Functions and your Salesforce org.
 * @param logger: logging handler used to capture application logs and trace specifically
 *                 to a given execution of a function.
 */
 
 module.exports = async function (event, context, logger) {
    
    let dataevent = JSON.stringify(event.data);
    logger.info(`Invoking Gzipinfo with payload ${dataevent}`);

    const zlib = require('zlib');

    zlib.gzip(dataevent, (err, buffer) => {

        if (!err) {

          console.log("results: " + buffer.toString('base64'));

          return " Data to return: " + buffer.toString('base64');
        }
        else {
          console.log(err);
          throw new Error(err);
        }
      });
    
}
