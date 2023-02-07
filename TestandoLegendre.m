a = 50;
b = 52;

x = linspace(a, b, 4096);
n = 48

    pabn = 2 * legendreP(n, (2*x - a - b)/(b-a))/(b-a);
    m = 48%randi([0 100],1);
    pabm = 2 * legendreP(m, (2*x - a - b)/(b-a))/(b-a);
    c = trapz(x, pabn.*pabm);
   cHumb = 4/((b-a) *(2 * n + 1));
   % cHumb = 0;
   % fprintf('%d %8.3f %8.3f\n', [n, c, cHumb]')
   fprintf('%d %d %8.3f %8.3f\n', [m, n, c, cHumb]')
