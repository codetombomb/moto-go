import useDebounce from "@/app/hooks/useDebounce";
import { useEffect, useRef, useState } from "react";

type Location = {
  address_line_1: string;
  address_line_2: string | null;
  city: string;
  country: string;
  created_at: string;
  id: number;
  state_province: string;
  updated_at: string;
  user_id: number;
  zip_postal_code: string | null;
};

function Landing() {
  const [cityInput, setCityInput] = useState<string>("");
  const [locations, setLocations] = useState<Location[]>([]);
  const [isDropdownOpen, setIsDropdownOpen] = useState<boolean>(false);
  const debouncedSearchTerm = useDebounce<string>(cityInput, 500);

  const wrapperRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handleClickOutside = (e: MouseEvent) => {
      if (
        wrapperRef.current &&
        !wrapperRef.current.contains(e.target as Node)
      ) {
        setIsDropdownOpen(false);
      }
    };
  }, []);

  useEffect(() => {
    if (debouncedSearchTerm) {
      handleCitySearch(debouncedSearchTerm);
      setIsDropdownOpen(true);
    } else {
      setIsDropdownOpen(false);
    }
  }, [debouncedSearchTerm]);

  const handleCitySearch = async (searchTerm: string) => {
    if (cityInput) {
      const resp = await fetch(`/locations/by-city/${cityInput}`);
      const data = await resp.json();
      setLocations(data);
    }
  };

  return (
    <section>
      <section className="text-gray-400 body-font">
        <div className="container mx-auto flex px-5 py-10 sm:py-24 md:flex-row flex-col items-center">
          <div className="lg:flex-grow md:w-1/2 lg:pr-24 md:pr-16 flex flex-col md:items-start md:text-left mb-16 md:mb-0 items-center text-center">
            <h1 className="title-font sm:text-4xl text-3xl mb-4 font-medium text-gray-500">
              Rent. Ride. Explore.
            </h1>
            <p className="mb-8 leading-relaxed">
              Whether you're looking to hit the open road with the perfect
              rental or want to make your motorcycle work for you, we've got you
              covered. Dive into our expansive listings to find your next
              adventure on two wheels, or discover how easy it is to list your
              motorcycle and start earning cash today.
            </p>
            <span className="text-green-700">
              Search by city to explore your possibilities!
            </span>
            <br />
            <div className="flex justify-between flex-col w-full max-w-lg sm:flex-row">
              <div className="relative min-w-72 w-full">
                <input
                  type="text"
                  id="name"
                  name="name"
                  className="bg-white rounded border border-gray-300 focus:border-green-500 focus:ring-2 focus:ring-green-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out w-full my-5 sm:my-0"
                  value={cityInput}
                  onChange={(e) => setCityInput(e.target.value)}
                  placeholder="Enter your city"
                />
              </div>
              <button
                className="text-white bg-green-500 border-0 py-2 px-6 focus:outline-none hover:bg-green-600 rounded text-lg sm:mx-5 text-nowrap h-11"
                onClick={() => handleCitySearch(cityInput)}
              >
                Search Bikes!
              </button>
            </div>
          </div>
          <div className="lg:max-w-lg lg:w-full md:w-1/2 w-5/6">
            <img
              className="object-cover object-center rounded"
              alt="hero"
              src="/motogo-landing-img.png"
            />
          </div>
        </div>
      </section>
    </section>
  );
}

export default Landing;
