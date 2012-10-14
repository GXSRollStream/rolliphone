class PersonController < UITableViewController

  def initWithContact(contact)
    initWithStyle(UITableViewStyleGrouped)
    @contact = contact
    self
  end

  def viewDidLoad
    view.dataSource = view.delegate = self
  end


  def tableView(tableView, numberOfRowsInSection:section)
    case section
    when 0
      2
    when 1
      2
    else
      1
    end
  end

  def tableView(tableView, titleForHeaderInSection:section)
    case section
    when 0
      'Basic Info'
    when 1
      2
    else
      1
    end
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue1, reuseIdentifier:CellID)
    cell.textLabel.text = @contact.first_name
    cell.detailTextLabel.text = 'First Name'
    cell
  end

  def tableView(tableView, editingStyleForRowAtIndexPath:indexPath)
    UITableViewCellEditingStyleDelete
  end

  def tableView(tableView, commitEditingStyle:editingStyle, forRowAtIndexPath:indexPath)
    location = @contacts[indexPath.row]
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationFade)
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    case indexPath.section
    when 0
    end

    tableView.deselectRowAtIndexPath(indexPath, animated:true)
  end
end
