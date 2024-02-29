import React from "react";

interface NavbarProps {
  user?: {
    id: number;
    first_name: string;
    last_name: string;
    email: string;
    phone_number: string;
  };
}

const Navbar: React.FC<NavbarProps> = ({ user }) => {
  return (
    <header className="text-gray-600 body-font">
      <div className="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <a className="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
          <img src="./motogo-logo.svg" alt="MotoGO motorcycle outline logo" />
          <span className="ml-3 text-xl text-gray-400">
            Moto<span className="text-green-600">GO</span>
          </span>
        </a>
        <nav className="md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
          <a className="mr-5 hover:text-gray-700">List My Bike</a>
          <a className="mr-5 hover:text-gray-700">How it works</a>
          <a className="mr-5 hover:text-gray-700">Shop Gear</a>
          <a className="mr-5 hover:text-gray-700">About</a>
        </nav>
        {!user && (
          <button className="text-gray-200 inline-flex items-center bg-gray-600 border-0 py-1 px-3 focus:outline-none hover:bg-green-400 hover:text-gray-700 rounded text-base mt-4 md:mt-0">
            <a href="/sign-up">Sign Up! &rarr;</a>
          </button>
        )}
      </div>
    </header>
  );
};

export default Navbar;
