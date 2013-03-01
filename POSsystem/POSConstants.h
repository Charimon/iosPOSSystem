//
//  POSConstants.h
//  POSsystem
//
//  Created by Andrew Charkin on 2/27/13.
//  Copyright (c) 2013 POS. All rights reserved.
//

//CONSTRAINT shorthand
#define ADD_CONSTRAINT(v, i1, a1, r, i2, a2, m, c)\
([v addConstraint:[NSLayoutConstraint constraintWithItem:i1 attribute:a1 relatedBy:r toItem:i2 attribute: a2 multiplier:m constant:c]])

//identifiers
#define COLLECTION_VIEW_CELL_IDENTIFIER @"COLLECTION_CELL"
#define TABLE_VIEW_CELL_INDENTIFIER @"TABLE_CELL"

//colors
#define IMAGE_LABEL_COLOR [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.4f]
#define HEADING_BACKGROUND_COLOR [UIColor colorWithRed:235.f/255.f green:235.f/255.f blue:235.f/255.f alpha:1.f]
#define HEADING_BACKGROUND_BORDER_COLOR [UIColor colorWithRed:205.f/255.f green:205.f/255.f blue:205.f/255.f alpha:1.f]

//sizes
#define NAVIGATION_BAR_HEIGHT 50.f