"use client"
import { Button } from "@/components/ui/button"
import { toast } from "sonner"

export default function ShowToast() {
  const handleClick = () => {
    toast.success(`Here is my toast ${Math.random()}`)
    console.log("hello par")
  }
  return <Button onClick={handleClick}>Show Toast</Button>
}
