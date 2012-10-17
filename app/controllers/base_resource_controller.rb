class BaseResourceController < UITableViewController
  attr_reader :resource_klass

  def viewDidLoad
    spinner = UIActivityIndicatorView.alloc.initWithActivityIndicatorStyle(UIActivityIndicatorViewStyleGray)
    spinner.center = self.view.center
    spinner.hidesWhenStopped = true
    self.view.backgroundColor = :white.uicolor
    self.view.addSubview(spinner)
    spinner.startAnimating
    @resources = resource_klass.load
    spinner.release
    view.dataSource = view.delegate = self
  end


  def tableView(tableView, numberOfRowsInSection:section)
    @resources.length
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)
    resource = @resources[indexPath.row]
    resource.construct_cell(cell)
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    resource = @resources[indexPath.row]
    controller = load_controller(resource)
    self.navigationController.pushViewController(controller, animated:true)

    tableView.deselectRowAtIndexPath(indexPath, animated:true)
  end
end
