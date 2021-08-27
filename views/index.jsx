const h = require("vhtml");
const Layout = require("./layout");

function Index({ title }) {
  return (
    <Layout title={title}>
      <h1>{title}</h1>
    </Layout>
  );
}

module.exports = Index;
