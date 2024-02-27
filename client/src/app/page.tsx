"use client";
import Image from "next/image";
import { useEffect } from "react";
import Navbar from "./components/Navbar";
import Landing from "./components/LandingSection";

export default function Home() {
  useEffect(() => {
    fetchPosts();
  }, []);

  const fetchPosts = async () => {
    const resp = await fetch("/rentals");
    const posts = await resp.json();
    console.log(posts);
  };

  return (
    <>
      <Navbar />
      <Landing />
    </>
  );
}
