const version = process.env.VERSION || "dev";
const appBuildSHA = process.env.APP_BUILD_SHA || "dev";

export default function handler(req, res) {
  res.status(200).json({
    version: version,
    appBuildSHA: appBuildSHA,
  });
}
