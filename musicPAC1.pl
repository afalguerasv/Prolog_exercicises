singer(a).
singer(b).

guitar(a).
guitar(c).
guitar(d).

bass(b).
bass(e).
bass(f).

battery(g).
battery(h).

album(w).
album(x).
album(y).
album(z).

band(m).
band(n).

artistBand(m, a).
artistBand(m, c).
artistBand(m, e).
artistBand(m, g).
artistBand(n, b).
artistBand(n, d).
artistBand(n, h).

albumBand(m, x).
albumBand(m, y).
albumBand(m, w).
albumBand(n, z).
albumBand(n, w).

albumColaboration(x, b, a).

sells(w, 5000).
sells(x, 50000).
sells(y, 3000).
sells(z, 25000).

%RULES

goldAlbum(A):- sells(A,X), X > 20000.
platinumAlbum(A):- sells(A,X), X > 40000.

goldOrPlatinum(goldAlbum,A):-album(A), goldAlbum(A).
goldOrPlatinum(platinumAlbum,A):-album(A),platinumAlbum(A).

artistAlbum(S,A):- singer(S), artistBand(B,S), albumBand(B,A).

knownSinger(S):- artistAlbum(S,A), goldAlbum(A).
famousSinger(S):-artistAlbum(S,A), platinumAlbum(A).

isColaboration(A,X,Y):-albumColaboration(A,X,Y); albumColaboration(A,Y,X).

grammyCandidate(S):-famousSinger(S);
                    isColaboration(A,S,Y), album(A), singer(Y), singer(S).

%P2 es el substitut
substitution(P1,P2):- guitar(P1), guitar(P2), not(artistBand(B,P2)), band(B);
                      bass(P1), bass(P2), not(artistBand(B,P2)), band(B);
                      battery(P1), battery(P2), not(artistBand(B,P2)), band(B).


