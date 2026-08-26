import { Link, useNavigate } from "@tanstack/react-router";
import { useQueryClient } from "@tanstack/react-query";
import { LogOut, Settings, User } from "lucide-react";

import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { supabase } from "@/integrations/supabase/client";

export function TopNav({ name, email }: { name: string; email: string }) {
  const navigate = useNavigate();
  const queryClient = useQueryClient();

  async function signOut() {
    await queryClient.cancelQueries();
    queryClient.clear();
    await supabase.auth.signOut();
    navigate({ to: "/", replace: true });
  }

  const initials = (name || email || "?").slice(0, 2).toUpperCase();

  return (
    <header className="sticky top-0 z-20 px-4 pt-4">
      <nav className="glass mx-auto flex max-w-6xl items-center justify-between rounded-2xl px-4 py-3">
        <Link to="/dashboard" className="flex items-center gap-2">
          <span className="size-2 rounded-full bg-primary glow" />
          <span className="font-display text-sm font-semibold tracking-tight">
            Globe<span className="text-gradient">Trotter</span>
          </span>
        </Link>

        <div className="flex items-center gap-2">
          <span className="mono-label hidden sm:block">itinerary studio</span>
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button variant="ghost" size="icon" className="rounded-full">
                <Avatar className="size-8">
                  <AvatarFallback className="bg-secondary text-xs">
                    {initials}
                  </AvatarFallback>
                </Avatar>
              </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end" className="w-56">
              <DropdownMenuLabel>
                <span className="block text-sm">{name}</span>
                <span className="block truncate text-xs text-muted-foreground">
                  {email}
                </span>
              </DropdownMenuLabel>
              <DropdownMenuSeparator />
              <DropdownMenuItem disabled>
                <User /> Profile
              </DropdownMenuItem>
              <DropdownMenuItem disabled>
                <Settings /> Settings
              </DropdownMenuItem>
              <DropdownMenuSeparator />
              <DropdownMenuItem onClick={signOut}>
                <LogOut /> Sign out
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
      </nav>
    </header>
  );
}
