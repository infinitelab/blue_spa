"use client";
import menuData from "@/app/data/navigation/menuData";
import Link from "next/link";
import { usePathname } from "next/navigation";

function SideBar({ role }) {
  const pathName = usePathname();
  const menuItems = role === "admin" ? menuData : menuData;

  return (
    <div className="w-64 min-h-screen bg-gray-800 text-white p-4">
        <div className="">
            <a href=""><h1 className="font-bold text-lg">BLUE SPA</h1></a>
        </div>

    </div>
  );
}

export default SideBar;
