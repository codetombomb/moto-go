"use client";
import Image from "next/image";
import { useEffect } from "react";
import Landing from "./components/LandingSection";

const Home = () => {
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
      <Landing />
    </>
  );
};

export default Home;
