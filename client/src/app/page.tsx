"use client";
import Image from "next/image";
import { useEffect } from "react";

export default function Home() {
  useEffect(() => {
    fetchPosts();
  }, []);

  const fetchPosts = async () => {
    const resp = await fetch("/rentals");
    const posts = await resp.json();
    console.log(posts);
  };

  return <section>This is the Home page</section>;
}
