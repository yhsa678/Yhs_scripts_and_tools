val = [1, 1, 102, 0, 0];
c = [153 217 234];


figure(1), clf
bar(val, 'FaceColor', c./255.0), hold on
set(gca,'xticklabel',[]);
text(0.3, val(1)+8, 'vegetation', 'FontSize', 15);
text(1.8, val(2)+8, 'sky', 'FontSize', 15);
text(2.5, val(3)+8, 'building', 'FontSize', 15);
text(3.6, val(4)+8, 'ground', 'FontSize', 15);
text(4.7, val(5)+8, 'other', 'FontSize', 15);
ylim([0 128])