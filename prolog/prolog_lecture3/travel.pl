/*
 * Backtracking: If a goal fails, prolog goes back to its last choice
 * and looks for an alternative. In example below, we backtrack after
 * has_money(mary) fails.
 */

on_vacation(mary).
on_vacation(peter).
on_vacation(alice).
has_money(peter).
has_money(alice).

travel(X):- on_vacation(X),has_money(X).