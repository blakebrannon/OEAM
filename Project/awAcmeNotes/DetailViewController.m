//
//  DetailViewController.m
//  awAcmeNotes
//
//  Created by Bill DeWeese on 8/25/13.
//  Copyright (c) 2013 AirWatch. All rights reserved.
//

#import "DetailViewController.h"
#import "Constants.h"
#import "Notes.h"


@interface DetailViewController ()
@property (assign, nonatomic) BOOL isDeleting;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    NSString *thisNote = [[Notes getAllNotes] objectForKey:[Notes getCurrentKey]];
   
    if ([thisNote isEqualToString:kDefaultNewNoteText]) {
        self.tvNoteText.text = @"";
    }else {
        self.tvNoteText.text = thisNote;
    }

    [self.tvNoteText becomeFirstResponder];
    
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon-trash"]
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(delete_onClick:)];
    
    self.navigationItem.rightBarButtonItem = menuItem;
 
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    if (self.isDeleting) {
        return;
    }
    
    if ([self.tvNoteText.text isEqualToString:@""] == NO) {
        [Notes setNoteForCurrentKey:self.tvNoteText.text];
    
    }else {
        [Notes removeObjectForKey:[Notes getCurrentKey]];
    }

    [Notes saveNotes];

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)delete_onClick:(id)sender{
    
    self.isDeleting = YES;
 
    [Notes removeObjectForKey:[Notes getCurrentKey]];
    [Notes saveNotes];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
   
    
};

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
