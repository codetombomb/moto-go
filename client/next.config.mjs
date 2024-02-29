/** @type {import('next').NextConfig} */
const nextConfig = {
  env: {
    backendURL: "http://localhost:3000/api",
  },
  rewrites: async () => {
    return [
      {
        source: "/:path*",
        destination: "http://localhost:3000/api/:path*", // Proxy to Backend
      },
    ];
  },
};

export default nextConfig;
