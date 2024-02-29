import type { AppProps } from "next/app";
import "../styles/globals.css";
import Navbar from "@/app/components/Navbar";

export default function MyApp({ Component, pageProps }: AppProps) {
  return (
    <>
      <Navbar />
      <Component {...pageProps} />
    </>
  );
}
