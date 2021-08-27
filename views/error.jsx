const h = require("vhtml");
const Layout = require("./layout");

function Error({ title, error, message }) {
  return (
    <Layout title={title}>
      <h1>{message}</h1>
      <h2>{error.status}</h2>
      <pre>{error.stack}</pre>
    </Layout>
  );
}

module.exports = Error;
