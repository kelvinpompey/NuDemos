(global UITableViewStylePlain 0)
(global UITableViewStyleGrouped 1)

(global UITableViewCellStyleDefault 0)
(global UITableViewCellStyleValue1 1) 
(global UITableViewCellStyleValue2 2) 
(global UITableViewCellStyleSubtitle 3)

(class RootViewController is UIViewController
	(ivar (id) tableView (id) favoriteLanguages) 
	(- (id) init is 
		(set @favoriteLanguages '("MacRuby" "RubyMotion" "Nu" "Clojure" "Scala")) 		
		(super initWithNibName: nil bundle:nil))

	(- (void) loadView is 
		(set @tableView ((UITableView alloc) initWithFrame: ((UIScreen mainScreen) bounds) 
													 style: UITableViewStylePlain))
		(self setView: @tableView))

	(- (void) viewDidLoad is 
		(@tableView setDelegate:self)
		(@tableView setDataSource:self))

	(- (int) tableView:(id) tableView numberOfRowsInSection: (id) section is (@favoriteLanguages count))

	(- (id) tableView:(id) tableView cellForRowAtIndexPath:(id) indexPath is
		(set identifier "cellidentifier")
		(set cell (tableView dequeueReusableCellWithIdentifier:identifier)) 
		(if (not cell)	
			(set cell ((UITableViewCell alloc) initWithStyle:UITableViewCellStyleDefault 
										 reuseIdentifier:"cellidentifier")))
		((cell textLabel) setText: (@favoriteLanguages (indexPath row)))
		cell))

(set rootController ((RootViewController alloc) init)) 
(set window (((UIApplication sharedApplication) delegate) window))	
(window setRootViewController: rootController)	
